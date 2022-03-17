--Basic Queries working with the AdventureWorks_2017 Database on MS Sql Server (SSMS) 
--Database used was titled 'AdCampaignDB'
--Author: Ryan Woodward

CREATE TABLE campaignManager (managerID int PRIMARY KEY NOT NULL, managerName varchar(30) NOT NULL);
CREATE TABLE adCampaign (campaignID int PRIMARY KEY NOT NULL, managerID int FOREIGN KEY REFERENCES campaignManager(managerID), startDate date NOT NULL, duration int);
CREATE TABLE campaignMode (modeID int PRIMARY KEY NOT NULL, media varchar(20), cRange varchar(20));
CREATE TABLE campaignBudget (campaignID int FOREIGN KEY REFERENCES adCampaign(campaignID), modeID int FOREIGN KEY REFERENCES campaignMode(modeID), budgetPctg int);