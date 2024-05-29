"use client";
import React from "react";
import { Button, Alert, AlertTitle } from "@mui/material";
import Image from "next/image";
import { useSession, signIn } from "next-auth/react";
import toast, { Toaster } from "react-hot-toast";
import { redirect } from "next/navigation";

const styles = {
  container: "flex flex-col items-center justify-center h-screen space-y-12",
  button: "w-80",
};

const notify = () =>
  toast.custom(
    <Alert variant="filled" severity="error">
      <AlertTitle>ログインに失敗しました</AlertTitle>
      詳しくは管理者にSlackでお問い合わせください。
    </Alert>,
    {
      duration: 3000,
      position: "top-right",
    }
  );

const LoginPage: React.FC = () => {
  const { data: session, status } = useSession();

  if (session) redirect("/");

  return (
    <div className={styles.container}>
      <Image src="/logo.png" width={300} height={100} alt="logo" priority />
      <Button
        variant="contained"
        color="primary"
        className={styles.button}
        startIcon={
          <Image src="/google.png" width={35} height={35} alt="google" />
        }
        sx={{
          ":hover": {
            bgcolor: "primary.main",
          },
        }}
        onClick={() => signIn()}
      >
        Google アカウントでログイン
      </Button>
      <Button
        variant="contained"
        color="primary"
        className={styles.button}
        sx={{
          ":hover": {
            bgcolor: "primary.main",
          },
        }}
        onClick={notify}
      >
        トースト通知
      </Button>
      <Toaster />
    </div>
  );
};

export default LoginPage;
