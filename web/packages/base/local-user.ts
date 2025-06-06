// TODO: This file belongs to the accounts package

import { z } from "zod/v4";
import { getKVS } from "./kv";

// TODO: During login the only field present is email. Which makes this
// optionality indicated by these types incorrect.
const LocalUser = z.object({
    /** The user's ID. */
    id: z.number(),
    /** The user's email. */
    email: z.string(),
    /**
     * The user's (plaintext) auth token.
     *
     * It is used for making API calls on their behalf, by passing this token as
     * the value of the X-Auth-Token header in the HTTP request.
     */
    token: z.string(),
});

/** Locally available data for the logged in user */
export type LocalUser = z.infer<typeof LocalUser>;

/**
 * Return the logged-in user, if someone is indeed logged in. Otherwise return
 * `undefined`.
 *
 * The user's data is stored in the browser's localStorage. Thus, this function
 * only works from the main thread, not from web workers (local storage is not
 * accessible to web workers).
 */
export const localUser = (): LocalUser | undefined => {
    // TODO: duplicate of getData("user")
    const s = localStorage.getItem("user");
    if (!s) return undefined;
    return LocalUser.parse(JSON.parse(s));
};

/**
 * A wrapper over {@link localUser} with that throws if no one is logged in.
 */
export const ensureLocalUser = (): LocalUser => {
    const user = localUser();
    if (!user) throw new Error("Not logged in");
    return user;
};

/**
 * Return the user's auth token, if present.
 *
 * The user's auth token is stored in KV DB after they have successfully logged
 * in. This function returns that saved auth token.
 *
 * The underlying data is stored in IndexedDB, and can be accessed from web
 * workers.
 */
export const getAuthToken = () => getKVS("token");

/**
 * Return the user's auth token, or throw an error.
 *
 * The user's auth token can be retrieved using {@link getAuthToken}. This
 * function is a wrapper which throws an error if the token is not found (which
 * should only happen if the user is not logged in).
 */
export const ensureAuthToken = async () => {
    const token = await getAuthToken();
    if (!token) throw new Error("Not logged in");
    return token;
};
