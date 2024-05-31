import { Request, Response } from "express";
import { prisma } from "../../utils/prisma";


export class PartsControllers {
    async createParts(request: Request, response: Response) {
        const { description, category, brand, serial, value } = request.body;

        try {
            const parts = await prisma.parts.findUnique({ where: { serial } });

            if (parts) {
                return response.status(401).json({ Mensagem: 'Esse número de série já esta cadastrado!' });
            }

            await prisma.parts.create({
                data: {
                    description, category, brand, serial, value
                }
            });

            return response.status(201).json("Cadastrado com sucesso!")


        } catch (error) {
            return response.status(500).json(error);
        }
    }


    async readParts(request: Request, response: Response) {
        const { id } = request.params;

        try {
            const parts = await prisma.parts.findUnique({ where: { id } });

            if (!parts) {
                return response.status(400).json("Produto não encontrado!");
            }

            return response.status(200).json(parts);

        } catch (error) {
            return response.status(500).json(error);
        }

    }


    async updateParts(request: Request, response: Response) {
        const { id } = request.params;
        const { description, category, brand, serial, value } = request.body;


        try {
            const partsExist = await prisma.parts.findUnique({ where: { id } });

            if (!partsExist) {
                return response.status(400).json("Produto não encontrado!")
            }

            await prisma.parts.update({
                where: { id },
                data: {
                    description, category, brand, serial, value
                }

            });

            return response.status(200).json("Atualizado com sucesso!")

        } catch (error) {
            return response.status(500).json(error);
        }

    }


    async deleteParts(request: Request, response: Response) {
        const { id } = request.params;

        try {
            const partsExist = await prisma.parts.findUnique({ where: { id } });

            if (!partsExist) {
                return response.status(400).json("Produto não encontrado!")
            }

            await prisma.parts.delete({ where: { id } });

            return response.status(200).json("Deletado com sucesso!")

        } catch (error) {
            return response.status(500).json(error);
        }

    }


    async readAllParts(request: Request, response: Response) {

        try {
            const readAllParts = await prisma.parts.findMany();

            return response.status(200).json(readAllParts);

        } catch (error) {
            return response.status(400).json(error);
        }

    }

}
