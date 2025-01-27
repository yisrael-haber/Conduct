import argparse
import subprocess

if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-t", "--tag", type=str, required=True)

    args = parser.parse_args()

    for method in ["worker", "conductor"]:
        ans = subprocess.check_output(
            [
                "docker",
                "build",
                "-t",
                f"{method}:{args.tag}",
                "--file",
                f"./src/{method}/Dockerfile",
                "."
            ], 
            text=True
        )