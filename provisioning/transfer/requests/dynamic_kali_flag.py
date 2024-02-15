import sys

REQUESTS_PY_LOCATION = "./exploit_dvwa.py"

def modify_requests_py(flag):
    with open(REQUESTS_PY_LOCATION, "r+") as f:
        contents = f.read()
        new_contents = contents.replace("$", flag)
        f.seek(0)
        f.write(new_contents)
        f.truncate()

def main():
    if len(sys.argv) > 1:
        flag = sys.argv[1]

        modify_requests_py(flag)

if __name__ == '__main__':
    main() 