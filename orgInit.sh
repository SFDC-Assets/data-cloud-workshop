sfdx shane:org:create -f config/project-scratch-def.json -d 30 -s --wait 60 --userprefix data -o cloud.workshop
sfdx shane:user:permset:assign -l User -g User -n CDPAdmin
# sfdx shane:user:psl -l User -g User -n GenieDataPlatformStarterPsl
# sfdx shane:user:psl -l User -g User -n CdpSegmentsActivationsCardPsl
# sfdx shane:user:psl -l User -g User -n CdpPsl
# sfdx shane:user:psl -l User -g User -n EinsteinAnalyticsPlusPsl
sfdx shane:user:password:set -p salesforce1 -g User -l User
# sfdx force:package:install -p 04tB0000000BYKv -w 10
# DC Sales cloud bundle = 04tB0000000BYKv
# DC service cloud bundle = 04t1Q000001V0kl
# Sharda data kit S3 = 04tHn000001eb4J
sfdx force:package:install -p 04tHn000001eb4J -w 10

sfdx force:source:push
# sf automig dump -d data -o Account,Contact,Opportunity,Lead,Task,Campaign,Case,AccountContactRelation,CampaignMember,Branch__c
sf automig load -d data
sfdx force:org:open
# Sf project retrieve start –-manifest scripts/package.xml
