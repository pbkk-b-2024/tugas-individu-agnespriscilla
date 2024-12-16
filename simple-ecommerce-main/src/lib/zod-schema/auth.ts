import * as z from "zod"

export const loginSchema = z.object({
    email: z.string().email({
        message: "Please enter a valid email address",
    }),
    password: z.string().min(1, {
        message: "Password required",
    }),
})

export const registerSchema = z.object({
    name: z.string().min(2, {
        message: "Name must be at least 2 characters long",
    }),
    email: z.string().email({
        message: "Please enter a valid email address",
    }),
    phoneNumber: z.string({message: "Phone number is required"}).max(30, {message: "Phone number must be less than 30 characters"}),
    password: z.string().min(8, {
        message: "Password must be at least 8 characters long",
    }),
    confirmPassword: z.string(),
}).refine((data) => data.password === data.confirmPassword, {
    message: "Passwords do not match",
    path: ["confirmPassword"],
})

export type LoginInput = z.infer<typeof loginSchema>
export type RegisterInput = z.infer<typeof registerSchema>

