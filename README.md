# p4-programs

How to build?

- `cd ..`
- `git clone https://github.com/engjefersonsantiago/behavioral-model.git bmv2`
- `git clone https://github.com/engjefersonsantiago/p4c-bm.git p4c-bmv2`
- `git clone https://github.com/engjefersonsantiago/rohc.git ROHC`
- `cd ROHC`
- `sudo ./autogen.sh`
- `sudo make install`
- `cd ../bmv2`
- `sudo ./autogen.sh`
- `sudo ./configure`
- `sudo make install`
- `cd ../p4c-bmv2`
- `sudo pip install -r requirements_v1_1.txt`
- `cd ../examples/<target_program>`

## target_program

Up to now there is just one supported P4 program in this repository: A ROHC compressing.


