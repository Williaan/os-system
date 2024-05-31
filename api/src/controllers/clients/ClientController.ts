import { Request, Response } from "express";
import { prisma } from '../../utils/prisma';


export class ClientController {
    async createClient(request: Request, response: Response) {

        const { name, email, cnpj, phone, cep, street, district, city, number } = request.body;

        try {
            const emailExist = await prisma.client.findUnique({ where: { email } });

            if (emailExist) {
                return response.status(401).json({ Mensagem: 'Esse e-mail já esta cadastrado!' });
            }

            const cnpjExist = await prisma.client.findUnique({ where: { cnpj } });

            if (cnpjExist) {
                return response.status(401).json({ Mensagem: 'Esse CNPJ já esta cadastrado!' });
            }


            await prisma.client.create({
                data: {
                    name,
                    email,
                    cnpj,
                    phone,
                    cep,
                    street,
                    district,
                    city,
                    number,

                }
            })

            return response.status(201).json({ mensagem: 'Cadastrado com sucesso!' });


        } catch (error) {
            return response.status(500).json(error);
        }
    }


    async readClient(request: Request, response: Response) {
        const { id } = request.params;

        try {
            const clientExist = await prisma.client.findUnique({ where: { id } });

            if (!clientExist) {
                return response.status(400).json("Esse cliente não foi encontrado!");
            }


            const readClient = await prisma.client.findUnique({ where: { id } });


            return response.status(200).json(readClient);

        } catch (error) {

        }


    }


    async updateCliente(request: Request, response: Response) {
        const { id } = request.params;
        const { name, email, cnpj, phone, cep, street, district, city, number } = request.body;


        try {
            const clientExist = await prisma.client.findUnique({ where: { id } });

            if (!clientExist) {
                return response.status(400).json("Esse cliente não foi encontrado!");
            }


            const upClient = await prisma.client.update({
                where: { id },
                data: {
                    name,
                    email,
                    cnpj,
                    phone,
                    cep,
                    street,
                    district,
                    city,
                    number,
                }

            })


            return response.status(201).json({ mensagem: 'Atualizado com sucesso!' });


        } catch (error) {
            return response.status(500).json(error);
        }
    }


    async deleteClient(request: Request, response: Response) {
        const { id } = request.params;

        try {
            const clientExist = await prisma.client.findUnique({ where: { id } });

            if (!clientExist) {
                return response.status(400).json("Esse cliente não foi encontrado!");
            }

            await prisma.client.delete({ where: { id } });

            return response.status(201).json({ mensagem: 'Deletado com sucesso!' });


        } catch (error) {
            return response.status(500).json(error);
        }
    }


    async readAllClients(request: Request, response: Response) {

        try {
            const readClients = await prisma.client.findMany();

            return response.status(200).json(readClients);

        } catch (error) {
            return response.status(400).json(error);
        }
    }
};
