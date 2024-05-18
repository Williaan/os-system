declare namespace NodeJS {
    interface ProcessEnv {
        SECRET_KEY: string;
        NODE_ENV: 'development' | 'production';
        PORT?: string;
        PWD: string;
    }
}