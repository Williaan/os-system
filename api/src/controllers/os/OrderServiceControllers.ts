import { Request, Response } from "express";
import { prisma } from '../../utils/prisma';


export class OrderServiceControllers {
    async createOrderService(request: Request, response: Response) {
        const { status, value, cliente, funcionario, pecas, serviço } = request.body;

        try {

            const file = await prisma.order_Service.create({
                data: {
                    status, value,
                    Client: {
                        connect: {
                            name: cliente
                        }
                    },
                    Employees: {
                        connect: {
                            name: funcionario
                        }
                    },

                    Parts: {
                        connect: {
                            description: pecas
                        }
                    },
                    Services: {
                        connect: {
                            description: serviço
                        }
                    }

                },

            });
            return response.status(201).json(file)


        } catch (error) {
            return response.status(500).json(error.message);
        }
    }


    async readAllOs(request: Request, response: Response) {
        try {

            const readAllEmploeeys = await prisma.order_Service.findMany({
                select: {
                    status: true,
                    value: true,
                    Client: {
                        select: {
                            name: true,
                        }
                    },
                    Employees: {
                        select: {
                            name: true
                        },

                    },
                    Services: {
                        select: {
                            description: true,
                            value: true
                        }
                    },
                    Parts: {
                        select: {
                            description: true,
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
}
