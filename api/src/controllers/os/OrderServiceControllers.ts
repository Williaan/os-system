import { Request, Response } from "express";
import { prisma } from '../../utils/prisma';


export class OrderServiceControllers {
    async createOrderService(request: Request, response: Response) {
        const { status, value } = request.body;
        const { id } = request.params;

        try {
            const client = await prisma.client.findUnique({ where: { id: Number(id) } });
            if (!client) {
                return response.status(400).json("Cliente inexistente!")
            }

            const emploeey = await prisma.employees.findUnique({ where: { id: Number(id) } });
            if (!emploeey) {
                return response.status(400).json("Funcionario inexistente!")
            }


            const parts = await prisma.parts.findUnique({ where: { id: Number(id) } });
            if (!parts) {
                return response.status(400).json("Peças inexistente!")
            }


            const service = await prisma.services.findUnique({ where: { id: Number(id) } });
            if (!service) {
                return response.status(400).json("Serviço inexistente!")
            }



            const os = await prisma.order_Service.create({
                data: {
                    status,
                    value,
                    clientId: client?.id,
                    employeesId: emploeey?.id,
                    partsId: parts?.id,
                    servicesId: service?.id
                }
            });
            return response.status(201).json(os)


        } catch (error) {
            return response.status(500).json(error);
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
