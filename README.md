# robot
## Run all tests
`rspec spec`

You'll find test files in `spec/test_files`

## Run program using STDIN
`ruby lib/main.rb`
`ruby lib/main.rb < spec/test_files/extra_a.txt`

# Considerations for the future
- Move coordinates into Table. It should be in charge of the grid.
- Make Module-based interfaces for Robot
- Create class for Direction and move left and right mapping into it
- Reconsider some of the code in `run_with_robot` and `run_instruction`
