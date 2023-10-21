# Shell Scripting

Create 5 files in each folder with some template text inside

```bash
for x in (0..5)
do
  touch "task0${x}/.sh"
done
```