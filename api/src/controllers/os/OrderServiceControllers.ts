import { Request, Response } from "express";
import { prisma } from '../../utils/prisma';


export class OrderServiceControllers {
    async createOrderService(request: Request, response: Response) {
        const { description, brand, serial, status, cliente, tecnico, pecas, service } = request.body;

        try {
            const parts = await prisma.order_Service.findUnique({ where: { serial } });

            if (parts) {
                return response.status(401).json({ Mensagem: 'Esse número de série já esta cadastrado!' });
            }

            const order = await prisma.order_Service.create({
                data: {
                    description, brand, serial, status,
                    Client: {
                        connect: {
                            name: cliente
                        }
                    },
                    Employees: {
                        connect: {
                            name: tecnico
                        }
                    },
                    Parts: {
                        connect: {
                            description: pecas
                        }
                    },
                    Services: {
                        connect: {
                            description: service
                        }
                    },
                }

            });

            return response.status(201).json(order)


        } catch (error) {
            return response.status(500).json(error);
        }
    }


    async readAllOs(request: Request, response: Response) {
        try {

            const readAllEmploeeys = await prisma.order_Service.findMany({
                select: {
                    id: true,
                    description: true,
                    brand: true,
                    serial: true,
                    status: true,
                    Client: {
                        select: {
                            id: true,
                            name: true,
                            email: true,
                            phone: true
                        }
                    },
                    Employees: {
                        select: {
                            id: true,
                            name: true
                        },

                    },
                    Services: {
                        select: {
                            id: true,
                            description: true,
                            value: true
                        }
                    },
                    Parts: {
                        select: {
                            id: true,
                            description: true,
                            brand: true,
                            value: true,
                        }
                    }
                }
            });

            return response.status(200).json(readAllEmploeeys);

        } catch (error) {
            return response.status(500).json(error);
        }
    }


    async deleteOs(request: Request, response: Response) {
        const { id } = request.params;

        try {
            const osExists = await prisma.services.findUnique({ where: { id } });

            if (!osExists) {
                return response.status(400).json("Ordem de Serviço não encontrado!")
            }

            await prisma.order_Service.delete({ where: { id } });

            return response.status(200).json("Deletado com sucesso!")

        } catch (error) {
            return response.status(500).json(error);
        }

    }
}
