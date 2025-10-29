import type { Metadata } from "next";
import "./globals.css";
import NavBar from "@/app/components/NavBar";
import Footer from "@/app/components/Footer";

// You can swap this font import later if the template already added one
export const metadata: Metadata = {
  title: "ZoneDojo",
  description:
    "ZoneDojo: Merch, creator editing services, and the 20K subscriber giveaway.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className="bg-zinc-950">
      <body className="flex min-h-screen flex-col bg-zinc-950 text-white antialiased">
        <NavBar />
        <main className="flex-1">{children}</main>
        <Footer />
      </body>
    </html>
  );
}
