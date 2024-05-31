import { Request, Response } from "express";
import { prisma } from '../../utils/prisma';


export class EmploeeysControllers {
    async createEmploeeys(request: Request, response: Response) {
        const { name, cpf, phone, cargo } = request.body;

        try {
            const cpfExist = await prisma.employees.findUnique({ where: { cpf } });

            if (cpfExist) {
                return response.status(400).json({ Mensagem: 'Esse CPF já existe' });
            }

            await prisma.employees.create({
                data: {
                    name, cpf, phone, cargo
                }
            });

            return response.status(201).json('Cadastrado com sucesso!');

        } catch (error) {
            return response.status(500).json(error);
        }
    }


    async readEmploeeys(request: Request, response: Response) {
        const { id } = request.params;

        try {
            const emploeey = await prisma.employees.findUnique({ where: { id } });

            if (!emploeey) {
                return response.status(400).json('Funcionário não encontrado!');
            }

            return response.status(200).json(emploeey);

        } catch (error) {
            return response.status(500).json(error)
        }
    }


    async updateEmploeeys(request: Request, response: Response) {
        const { id } = request.params;
        const { name, cpf, phone, cargo } = request.body;

        try {

            const emploeeyExist = await prisma.employees.findUnique({ where: { id } });

            if (!emploeeyExist) {
                return response.status(400).json('Funcionário não encontrado!');
            }

            await prisma.employees.update({
                where: { id },
                data: {
                    name, cpf, phone, cargo
                }
            });

            return response.status(200).json('Atualizado com sucesso!');

        } catch (error) {
            return response.status(500).json(error);
        }
    }


    async deleteEmploeeys(request: Request, response: Response) {
        const { id } = request.params;

        try {
            const emploeeyExist = await prisma.employees.findUnique({ where: { id } });

            if (!emploeeyExist) {
                return response.status(400).json('Funcionário não encontrado!');
            }

            await prisma.employees.delete({ where: { id } });

            return response.status(200).json('Deletado com sucesso!');

        } catch (error) {
            return response.status(500).json(error);
        }
    }


    async readAllEmploeeys(request: Request, response: Response) {
        try {

            const readAllEmploeeys = await prisma.employees.findMany();

            return response.status(200).json(readAllEmploeeys);

        } catch (error) {
            return response.status(500).json(error);
        }
    }
}
