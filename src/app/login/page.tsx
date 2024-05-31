"use client";
import React from "react";
import { Button } from "@mui/material";
import Image from "next/image";
import { signIn } from "next-auth/react";
import { useSearchParams } from "next/navigation";

const styles = {
  container: "flex flex-col items-center justify-center h-screen space-y-12",
  button: "w-80",
};

const LoginPage: React.FC = () => {
  const searchParams = useSearchParams();
  const callbackUrl = searchParams.get("callbackUrl") || "/";

  return (
    <div className={styles.container}>
      <Image src="/logo.svg" width={300} height={100} alt="logo" priority />
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
          padding: "10px",
          ":hover": {
            bgcolor: "#fff",
          },
        }}
        onClick={() => signIn("google", { callbackUrl })}
      >
        Google アカウントでログイン
      </Button>
    </div>
  );
};

export default LoginPage;
