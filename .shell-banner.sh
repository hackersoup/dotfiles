# Funny terminal banner that shows a cow saying a quote, and displays the current weather next to it.
# Uses a neat feature of bash I found, <(), which creates a transient file for the program argument.
paste <(fortune | cowsay) <(curl -s "wttr.in/14623" | head -n 7)| column -s $'\t' -t | lolcat
