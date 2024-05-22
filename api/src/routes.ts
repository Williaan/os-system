import { Router } from "express";
import { UserController } from "./controllers/users/UserController";
import { LoginController } from "./controllers/users/LoginController";
import { ClientController } from "./controllers/clients/ClientController";
import { EmploeeysControllers } from "./controllers/emploeeys/EmploeeysControllers";
import { PartsControllers } from "./controllers/parts/PartsControllers";
import { ServiceControllers } from "./controllers/services/ServiceController";
import { OrderServiceControllers } from "./controllers/os/OrderServiceControllers";


export const router = Router();


const userController = new UserController();
const loginController = new LoginController();
const clientController = new ClientController();
const emploeeysControllers = new EmploeeysControllers();
const partsControllers = new PartsControllers();
const serviceControllers = new ServiceControllers();
const orderServicecontrollers = new OrderServiceControllers();


//Users
router.post('/register', userController.createUser);
router.post('/login', loginController.login);

//Clientes
router.post('/create-client', clientController.createClient);
router.get('/read-client/:id', clientController.readClient);
router.put('/update-client/:id', clientController.updateCliente);
router.delete('/delete-client/:id', clientController.deleteClient);
router.get('/readAll-client', clientController.readAllClients);

//Funcionarios
router.post('/create-emploeey', emploeeysControllers.createEmploeeys);
router.get('/read-emploeey/:id', emploeeysControllers.readEmploeeys);
router.put('/update-emploeey/:id', emploeeysControllers.updateEmploeeys);
router.delete('/delete-emploeey/:id', emploeeysControllers.deleteEmploeeys);
router.get('/read-emploeey', emploeeysControllers.readAllEmploeeys);

//Parts
router.post('/create-parts', partsControllers.createParts);
router.get('/read-parts/:id', partsControllers.readParts);
router.put('/update-parts/:id', partsControllers.updateParts);
router.delete('/delete-parts/:id', partsControllers.deleteParts);
router.get('/read-parts', partsControllers.readAllParts);

//Service
router.post('/create-service', serviceControllers.createService);
router.get('/read-service/:id', serviceControllers.readService);
router.put('/update-service/:id', serviceControllers.updateService);
router.delete('/delete-service/:id', serviceControllers.deleteService);
router.get('/read-service', serviceControllers.readAllService);

//O.S
router.post('/create-os', orderServicecontrollers.createOrderService);
router.get('/readall-os', orderServicecontrollers.readAllOs);
