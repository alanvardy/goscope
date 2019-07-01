# Goscope

A little command line program to help generate scoping documents for Rails projects. It creates a nested abstract syntax tree that can then generate multiple custom rows in CSV file for import into Google Sheets etc.

The idea is for this program to get you 80% there and eliminate the mind-numbing parts of scoping, so that your mental energy can be redirected to finding those bizarre edge cases.

## Run it

This generated binary (goscope in the root directory) is cross platform and requires the installation of only one dependency:
[erlang](https://www.erlang.org/)

run the binary

```bash
./goscope
```

## Use it

The actual interface is very simple, you just keep adding items to the previous item you created, and use `[d]one` to go 'up' the tree one level.
