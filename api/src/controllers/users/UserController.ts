import { Request, Response } from 'express';
import { prisma } from '../../utils/prisma';
import { hash } from "bcryptjs";

export class UserController {

    async createUser(request: Request, response: Response) {
        const { name, email, password } = request.body;

        try {

            const existEmail = await prisma.user.findUnique({ where: { email } });

            if (existEmail) {
                return response.status(400).json({ mensagem: 'Já existe um E-mail cadastrado!!' })
            }

            const hashPassword = await hash(password, 8);

            const user = await prisma.user.create({
                data: {
                    name,
                    email,
                    password: hashPassword
                }
            });

            return response.status(200).json('Criado com sucesso!');


        } catch (error) {
            return response.status(500).json(error);
        }
    }
}