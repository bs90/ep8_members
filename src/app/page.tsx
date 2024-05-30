"use client";
import { useSession } from "next-auth/react";
import Skeleton from "@mui/material/Skeleton";
import { useRouter } from "next/navigation";
import { signOut } from "next-auth/react";
import { Button } from "@mui/material";
import Image from "next/image";

export default function Home() {
  const { data: session, status } = useSession();
  const router = useRouter();

  return (
    <div className="flex items-center flex-col justify-center h-screen">
      <h1 className="text-3xl font-bold">Next Auth</h1>
      <div className="flex items-center flex-col m-5">
        {status === "loading" && (
          <Skeleton variant="text" animation="wave" width={175} height={25} />
        )}
      </div>
      {!session && (
        <Button
          onClick={() => router.push("/login")}
          variant="contained"
          color="primary"
        >
          ログイン
        </Button>
      )}
      {session && (
        <>
          <Image
            src={session?.user?.image || ""}
            alt="user_avatar"
            width={75}
            height={75}
          />
          <div className="m-4">
            <p className="text-center">Name: {session?.user?.name}</p>
            <p className="text-center">Email: {session?.user?.email}</p>
          </div>
          <Button variant="contained" color="error" onClick={() => signOut()}>
            ログアウト
          </Button>
        </>
      )}
    </div>
  );
}
