# `x86-interview` 🤵

> An x86 assembly program that walks through a digital interview.

## License 🔑

This project utilizes version 3 of the [GNU General Public License](LICENSE).

## Usage ✨

1. Clone
1. Install
1. Run program

```sh
git clone https://github.com/EthanThatOneKid/x86-interview.git
cd x86-interview

bash ./i.sh # Installs and compiles program.
./a.out     # Runs compiled program.
```

## Development 👨‍💻

### Clone Repository

```sh
git clone https://github.com/EthanThatOneKid/x86-interview.git
```

or [download the repository](https://github.com/EthanThatOneKid/x86-interview/archive/main.zip) and manually locate a place for it to live on your machine.

### Install Dependencies

This project depends on the existence of several programs and is intended to be used within a Linux-like terminal.

```sh
sudo apt install gcc g++ nasm gdb
```

## Run Program

Once you have installed the dependencies, running the program is as easy as `./r.sh`!
Alternatively, you may run a debugging (GDB) instance of the program with `./rg.sh`.

## Test Program

Once the dependencies are installed, the program can be tested out without the need of manually inputting the interview responses.
There are 3 different test-interviewees: Chris Sawyer ([`chris.txt`](test-inputs/chris.txt)), a computer science major named Joey Brown ([`csmajor.txt`](test-inputs/csmajor.txt)), and a social science major named Joey Brown ([`social.txt`](test-inputs/social.txt)).

To run all of the tests, simply run the following command:

```sh
bash t.sh
```

To run a specific test, refer to the following example:

```sh
bash r.sh < test-inputs/chris.txt
```

---

Assembled with 💖 by [EthanThatOneKid](https://github.com/EthanThatOneKid/)
