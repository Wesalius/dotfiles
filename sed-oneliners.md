```
sed [options] sed-command [input-file]
```
## Substitution
`sed 's/hello/world/' input.txt > output.txt`

## Delete a Line Containing a Specific String
`sed '/foo/d' bar.txt`

## Insert text to beginning of file
`sed -i '1s/^/foo/' bar.txt`

## Insert text to end of file
`sed -e "\$aFOOBAR"`

## Extract first line of a file
`sed -n '1p' foo.txt`

## Extract Lines that start with a specified string
`sed -n -e '/^String/p' foo.txt`

## Extract Lines that end with a specified string
`sed -n -e '/String$/p' foo.txt`

## Make all letters lowercase
`sed 's/./\L&/g' file.txt`

## Make All Letters Uppercase
`sed 's/./\U&/g' file.txt`

## Convert DOS newlines (CR/LF) to Unix format
`sed 's/.$//'`

## Convert Unix newlines (LF) to DOS format
`sed 's/$'"/`echo \\\r`/"`

## Delete trailing whitespace (spaces, tabs) from end of each line
`sed 's/[ \t]*$//'`

## Delete leading whitespace (spaces, tabs) from front of each line
`sed 's/^[ \t]*//'`

## Insert 4 blank spaces at beginning of each line
`sed 's/^/    /'`

## Print first 10 lines of file
`sed 10q`

## Print only lines which do not match regular expression
`sed -n '/regexp/!p' or sed -n '/regexp/d'`

## Print only lines of less than 65 characters
`sed -n '/^.\{65\}/!p'`

## Print only lines of 65+ characters
`sed -n '/^.\{65\}/p'`

## Print line number 52
`sed -n '52p'`

## Delete the first 10 lines of a file
`sed '1,10d'`

## Delete the last line of a file
`sed '$d'`

# Delete lines matching pattern
`sed '/pattern/d'`

## Delete ALL blank lines from a file
`sed '/^$/d'`

## Add string to the beginning
`sed 's/^/PREFIX/' FILE`

## Add string to the end of line
`sed 's/$/SUFFIX/' FILE`

## Add string to the beginning and end of line
`sed 's/.*/PREFIX&SUFFIX/' FILE`

| Option | Description                             | Example                                      |
| ------ |---------------------------------------- | -------------------------------------------- |
| `-n`   | Suppress default pattern space printing | `sed -n '3 p' config.conf`                   |
| `-i`   | Backup and modify input file directly   | `sed -ibak 's/On/Off/' php.ini`              |
| `-f`   | Execute sed script file                 | `sed -f script.sed config.conf`              |
| `-e`   | Execute multiple sed commands           | `sed -e 'command1' -e 'command2' input-file` |
| ------- |----------------------------- | ----------------------------------------- |
| `p`     | Print pattern space          | `sed -n '1,4 p' input.txt`                |
| `d`     | Delete lines                 | `sed -n '1,4 d' input.txt`                |
| `w`     | Write pattern space to file  | `sed -n '1,4 w output.txt' input.txt`     |
| `a`     | Append line after            | `sed '2 a new-line' input.txt`            |
| `a`     | Insert line before           | `sed '2 i new-line' input.txt`            |

## Sed substitute command and flags

```
sed 's/original-string/replacement-string/[flags]' [input-file]
```
| Flag             | Description                                 | Example                                                |
| ---------------- |-------------------------------------------- | ------------------------------------------------------ |
| `g`              | Global substitution                         | `sed 's/development/production/g' .env`                |
| `1,2...`         | Substitute the nth occurrence               | `sed 's/latin1/utf8/2' locale.sql`                     |
| `p`              | Print only the substituted line             | `sed -n 's/error_log = 0/error_log = 1/p' php.ini`     |
| `i`              | Ignore case while searching                 | `sed 's/true/FALSE/i' config.php`                      |
| `&`              | Gets the matched pattern                    | `sed 's/^.*/<&>/' index.xml`                           |
