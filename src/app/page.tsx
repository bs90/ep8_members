"use client";
import { useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import { signOut } from "next-auth/react";
import { Button } from "@mui/material";
import Image from "next/image";
import Loading from "@/app/loading";

export default function Home() {
  const { data: session, status } = useSession();
  const router = useRouter();

  if (status === "loading") return <Loading />;

  return (
    <div className="flex items-center flex-col justify-center h-screen">
      <h1 className="text-3xl font-bold mb-4">Next Auth</h1>
      {session ? (
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
      ) : (
        <>
          <p className="mb-4">まだログインしていません</p>
          <Button
            onClick={() => router.push("/login")}
            variant="contained"
            color="primary"
          >
            ログイン
          </Button>
        </>
      )}
    </div>
  );
}
