<# 
# TASK 5
# Create a script that simulates pinging a remote server. It takes two named parameters. 
# The first parameter is the IP-address of a server, second how many times the ping is tried. 
# The script also ask the permission to make ping with. Pings are made only if a user says Yes. 
# Give default values for the parameters, so if the script will be run without the arguments, it will try to ping `192.168.1.1` only once. Because `ping` is blocked in the labranet, we simulate only pinging.
 #>

param(
  [string]$ip = '192.168.1.1',
  [int]$tries = 1
)

$consent = Read-Host "I will ping address $ip $tries time, Okay? `n[Y/n]"

if ($consent -eq 'Y') {
  for ($i = 0; $i -lt $tries; $i++) {
    # try 1 to ping: 192.168.1.1
    Write-Output("try $($i + 1) to ping: $ip")
    # ($i + 1) because the index for the loop starts at zero
  }
}