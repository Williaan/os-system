import { Request, Response } from "express";
import { prisma } from '../../utils/prisma';
import { compare } from 'bcryptjs';
import { sign } from 'jsonwebtoken';


export class LoginController {
    async login(request: Request, response: Response) {
        const { email, password } = request.body;

        try {

            const userExist = await prisma.user.findUnique({ where: { email } });

            if (!userExist) {
                return response.status(400).json({ mensagem: 'E-mail ou senha incorretos!' })
            }

            const isPassword = await compare(password, userExist.password);

            if (!isPassword) {
                return response.status(400).json({ mensagem: "E-mail ou senha incorretos, verifique novamente!" })
            }

            const token = await sign({ id: userExist.id }, process.env.SECRET_KEY, { expiresIn: '1d' })

            const { id, name } = userExist;

            return response.status(200).json({ user: { id, name }, token });


        } catch (error) {
            return response.status(500).json(error);
        }
    }
}