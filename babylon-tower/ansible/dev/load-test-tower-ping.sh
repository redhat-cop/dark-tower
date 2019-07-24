for i in {1..100}
do

     echo "Tower API Call $i"
     tower-cli job launch --job-template=deployer-ping -e @/Users/tok/secrets/three-tier-app-vars.yml
 done
