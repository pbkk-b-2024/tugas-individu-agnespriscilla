import type { Metadata } from "next";


import { DM_Sans } from 'next/font/google'

import "./globals.css";
import {ReactNode} from "react";

import { Toaster } from "@/components/ui/toaster"

const dmSans = DM_Sans({subsets: ['latin']})

export const metadata: Metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`${dmSans.className} antialiased`}
      >
      <div className={'w-full h-screen dark:bg-black bg-white dark:bg-dot-white/[0.2] bg-dot-black/[0.2]'}>
          {children}
      </div>

        <Toaster />
      </body>
    </html>
  );
}
