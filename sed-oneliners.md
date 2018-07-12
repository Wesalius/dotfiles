```
sed[options] sed-command [input-file]
```

## Substitution
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`\\\r`/"`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
`sed 's/.*/PREFIX&SUFFIX/' FILE`

`sed 's/.*/PREFIX&SUFFIX/' FILE`
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
