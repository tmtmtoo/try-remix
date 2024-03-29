import { Component, Result } from "../types";
import { User } from "./entities";
import { Email } from "./values";

export class IoError extends Error {
    // biome-ignore lint: <any>
    constructor(...args: any) {
        super(args);
        this.name = this.constructor.name;
    }
}

export class DataConsistencyError extends Error {
    // biome-ignore lint: <any>
    constructor(...args: any) {
        super(args);
        this.name = this.constructor.name;
    }
}

export type FindUser<Context> = Component<
    Email,
    Context,
    Result<User | null, IoError | DataConsistencyError | Error>
>;

export type PersistUser<Context> = Component<
    User,
    Context,
    Result<User, IoError | DataConsistencyError | Error>
>;
