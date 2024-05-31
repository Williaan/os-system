import { Request, Response } from "express";
import { prisma } from "../../utils/prisma";


export class ServiceControllers {
    async createService(request: Request, response: Response) {
        const { description, value } = request.body;

        try {
            const service = await prisma.services.findUnique({ where: { description } });

            if (service) {
                return response.status(401).json({ Mensagem: 'Esse serviço já esta cadastrado!' });
            }

            await prisma.services.create({
                data: {
                    description, value
                }
            });

            return response.status(201).json("Cadastrado com sucesso!")


        } catch (error) {
            return response.status(500).json(error);
        }
    }


    async readService(request: Request, response: Response) {
        const { id } = request.params;

        try {
            const services = await prisma.services.findUnique({ where: { id } });

            if (!services) {
                return response.status(400).json("Serviço não encontrado!");
            }

            return response.status(200).json(services);

        } catch (error) {
            return response.status(500).json(error);
        }

    }


    async updateService(request: Request, response: Response) {
        const { id } = request.params;
        const { description, value } = request.body;


        try {
            const partsExist = await prisma.services.findUnique({ where: { id } });

            if (!partsExist) {
                return response.status(400).json("Serviço não encontrado!")
            }

            await prisma.services.update({
                where: { id },
                data: {
                    description, value
                }

            });

            return response.status(200).json("Atualizado com sucesso!")

        } catch (error) {
            return response.status(500).json(error);
        }

    }


    async deleteService(request: Request, response: Response) {
        const { id } = request.params;

        try {
            const serviceExist = await prisma.services.findUnique({ where: { id } });

            if (!serviceExist) {
                return response.status(400).json("Serviço não encontrado!")
            }

            await prisma.services.delete({ where: { id } });

            return response.status(200).json("Deletado com sucesso!")

        } catch (error) {
            return response.status(500).json(error);
        }

    }


    async readAllService(request: Request, response: Response) {

        try {
            const readAllService = await prisma.services.findMany();

            return response.status(200).json(readAllService);

        } catch (error) {
            return response.status(400).json(error);
        }

    }

}
