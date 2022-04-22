CREATE TABLE campaignManager (managerID int PRIMARY KEY NOT NULL, managerName varchar(30) NOT NULL);

CREATE TABLE adCampaign (campaignID int PRIMARY KEY NOT NULL, managerID int FOREIGN KEY campaignManager(managerID), startDate date NOT NULL, duration int);

CREATE TABLE campaignMode (modeID int PRIMARY KEY NOT NULL, media varchar(20), cRange varchar(20));

CREATE TABLE campaignBudget (campaignID int FOREIGN KEY REFERENCES adCampaign(campaignID), modeID int FOREIGN KEY REFERENCES campaignMode(modeID), budgetPctg int);



INSERT INTO campaignManager VALUES(100, 'Roberta');

INSERT INTO campaignManager VALUES(101, 'Sue');

INSERT INTO campaignManager VALUES (102, 'John');

INSERT INTO campaignManager VALUES (103, 'Nancy');



INSERT INTO adCampaign VALUES (111, 100, 'SummerFun13', '6/6/2013', 12);

INSERT INTO adCampaign VALUES (222, 101, 'SummerZing13', '6/6/2013',30);

INSERT INTO adCampaign VALUES (333, 102, 'FallBall13', '6/9/2013', 12);

INSERT INTO adCampaign VALUES (444, 103, 'AutumnStyle13', '6/9/2013', 5);

INSERT INTO adCampaign VALUES (555, 100, 'AutumnColors13', '6/9/2013', 3);

--Inserts Successfully

INSERT INTO campaignMode VALUES (1, 'TV', 'Local');

INSERT INTO campaignMode VALUES (2, 'TV', 'National');

INSERT INTO campaignMode VALUES (3, 'Radio', 'Local');

INSERT INTO campaignMode VALUES (4, 'Radio', 'National');

INSERT INTO campaignMode VALUES (5, 'Print', 'Local');

INSERT INTO campaignMode VALUES (6, 'Print', 'National');

INSERT INTO campaignMode VALUES (7, 'Internet', 'National');


INSERT INTO campaignBudget VALUES (111, 1, 50);

INSERT INTO campaignBudget VALUES (111, 2, 50);

INSERT INTO campaignBudget VALUES (222, 1, 60);

INSERT INTO campaignBudget VALUES (222,3, 30);

INSERT INTO campaignBudget VALUES (222, 5, 10);

INSERT INTO campaignBudget VALUES (333, 3, 80);

INSERT INTO campaignBudget VALUES (333, 4, 20);

INSERT INTO campaignBudget VALUES (444, 6, 100);

INSERT INTO campaignBudget VALUES (555, 3, 100);