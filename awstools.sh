#!/bin/bash
#
# An extremely cheezy script to automate downloading and installing AWS command line tools
#
#

sudo apt-get update

sudo apt-get install -y openjdk-6-jre ruby1.8-full rubygems libxml2-utils libxml2-dev libxslt-dev unzip cpanminus build-essential

sudo gem install uuidtools json httparty nokogiri

	echo Installing all AWS command line tools...

		sudo mkdir -p /usr/local/aws

		wget --quiet http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
		unzip -qq ec2-api-tools.zip
		sudo rsync -a --no-o --no-g ec2-api-tools-*/ /usr/local/aws/ec2/


		wget --quiet http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip
		unzip -qq ec2-ami-tools.zip
		sudo rsync -a --no-o --no-g ec2-ami-tools-*/ /usr/local/aws/ec2/


		wget --quiet http://awsiammedia.s3.amazonaws.com/public/tools/cli/latest/IAMCli.zip
		unzip -qq IAMCli.zip
		sudo rsync -a --no-o --no-g IAMCli-*/ /usr/local/aws/iam/


		wget --quiet http://s3.amazonaws.com/rds-downloads/RDSCli.zip
		unzip -qq RDSCli.zip
		sudo rsync -a --no-o --no-g RDSCli-*/ /usr/local/aws/rds/


		wget --quiet http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip
		unzip -qq ElasticLoadBalancing.zip
		sudo rsync -a --no-o --no-g ElasticLoadBalancing-*/ /usr/local/aws/elb/


		wget --quiet https://s3.amazonaws.com/cloudformation-cli/AWSCloudFormation-cli.zip
		unzip -qq AWSCloudFormation-cli.zip
		sudo rsync -a --no-o --no-g AWSCloudFormation-*/ /usr/local/aws/cfn/


		wget --quiet http://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip
		unzip -qq AutoScaling-*.zip
		sudo rsync -a --no-o --no-g AutoScaling-*/ /usr/local/aws/as/


		wget --quiet http://awsimportexport.s3.amazonaws.com/importexport-webservice-tool.zip
		sudo mkdir /usr/local/aws/importexport
		sudo unzip -qq importexport-webservice-tool.zip -d /usr/local/aws/importexport


		wget --quiet http://s3.amazonaws.com/amazon-cloudsearch-data/cloud-search-tools-1.0.0.1-2012.03.05.tar.gz
		tar xzf cloud-search-tools*.tar.gz
		sudo rsync -a --no-o --no-g cloud-search-tools-*/ /usr/local/aws/cloudsearch/


		wget --quiet http://ec2-downloads.s3.amazonaws.com/CloudWatch-2010-08-01.zip
		unzip -qq CloudWatch-*.zip
		sudo rsync -a --no-o --no-g CloudWatch-*/ /usr/local/aws/cloudwatch/


		wget --quiet https://s3.amazonaws.com/elasticache-downloads/AmazonElastiCacheCli-2012-03-09-1.6.001.zip
		unzip -qq AmazonElastiCacheCli-*.zip
		sudo rsync -a --no-o --no-g AmazonElastiCacheCli-*/ /usr/local/aws/elasticache/


		wget --quiet https://s3.amazonaws.com/elasticbeanstalk/cli/AWS-ElasticBeanstalk-CLI-2.1.zip
		unzip -qq AWS-ElasticBeanstalk-CLI-*.zip
		sudo rsync -a --no-o --no-g AWS-ElasticBeanstalk-CLI-*/ /usr/local/aws/elasticbeanstalk/


		wget --quiet http://elasticmapreduce.s3.amazonaws.com/elastic-mapreduce-ruby.zip
		unzip -qq -d elastic-mapreduce-ruby elastic-mapreduce-ruby.zip
		sudo rsync -a --no-o --no-g elastic-mapreduce-ruby/ /usr/local/aws/elasticmapreduce/


		wget --quiet http://sns-public-resources.s3.amazonaws.com/SimpleNotificationServiceCli-2010-03-31.zip
		unzip -qq SimpleNotificationServiceCli-*.zip
		sudo rsync -a --no-o --no-g SimpleNotificationServiceCli-*/ /usr/local/aws/sns/
		sudo chmod 755 /usr/local/aws/sns/bin/*


		sudo mkdir -p /usr/local/aws/route53/bin

	for i in dnscurl.pl route53tobind.pl bindtoroute53.pl route53zone.pl; do
  		sudo wget --quiet --directory-prefix=/usr/local/aws/route53/bin      http://awsmedia.s3.amazonaws.com/catalog/attachments/$i
  		sudo chmod +x /usr/local/aws/route53/bin/$i
	done

		cpanm --sudo --notest --quiet Net::DNS::ZoneFile NetAddr::IP Net::DNS Net::IP Digest::HMAC Digest::SHA1 Digest::MD5


		sudo wget --quiet --directory-prefix=/usr/local/aws/cloudfront/bin   http://d1nqj4pxyrfw2.cloudfront.net/cfcurl.pl
		sudo chmod +x /usr/local/aws/cloudfront/bin/cfcurl.pl


		wget --quiet http://s3.amazonaws.com/doc/s3-example-code/s3-curl.zip
		unzip -qq s3-curl.zip
		sudo mkdir -p /usr/local/aws/s3/bin/
		sudo rsync -a --no-o --no-g s3-curl/ /usr/local/aws/s3/bin/
		sudo chmod 755 /usr/local/aws/s3/bin/s3curl.pl


		wget --quiet https://s3.amazonaws.com/datapipeline-us-east-1/software/latest/DataPipelineCLI/datapipeline-cli.zip
		unzip -qq datapipeline-cli.zip
		sudo rsync -a --no-o --no-g datapipeline-cli/ /usr/local/aws/datapipeline/

echo Cleaning up the temp files...

	rm -rf AmazonElastiCacheCli-* AutoScaling-* AWSCloudFormation-* AWS-ElasticBeanstalk-CLI-2.1* CloudWatch-* datapipeline-cli* ec2-ami-tools* ec2-api-tools* ElasticLoadBalancing* elastic-mapreduce-ruby* IAMCli* importexport-webservice-tool* RDSCli* s3-curl* SimpleNotificationServiceCli-* AutoScaling-* cloud-search-tools-*

echo done

echo Now setup credentials as outlined here: http://alestic.com/2012/09/aws-command-line-tools

