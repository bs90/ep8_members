"use client";
import React from "react";
import { Button } from "@mui/material";
import Image from "next/image";
import { useSession, signIn } from "next-auth/react";
import { redirect } from "next/navigation";

const styles = {
  container: "flex flex-col items-center justify-center h-screen space-y-12",
  button: "w-80",
};

const LoginPage: React.FC = () => {
  const { data: session, status } = useSession();

  if (session) redirect("/");

  return (
    <div className={styles.container}>
      <Image src="/logo.png" width={300} height={100} alt="logo" priority />
      <Button
        variant="contained"
        color="secondary"
        className={styles.button}
        startIcon={
          <Image
            src="https://authjs.dev/img/providers/google.svg"
            width={30}
            height={30}
            alt="google"
            className="mr-2"
          />
        }
        sx={{
          ":hover": {
            bgcolor: "#fff",
          },
          padding: "10px",
        }}
        onClick={() => signIn("google")}
      >
        Google アカウントでログイン
      </Button>
    </div>
  );
};

export default LoginPage;
