rm(list=ls())
library(xts)
library(zoo)
library(quantmod)
library(tidyr)

AZTK<-getSymbols("AZTECACPO.MX",src="yahoo",auto.assign = F)
AZTK<-dailyReturn(Ad(AZTK))
charts.PerformanceSummary(AZTK)

TELE<-getSymbols("TLEVISACPO.MX",src="yahoo",auto.assign = F)
TELE<-dailyReturn(Ad(TELE))
charts.PerformanceSummary(TELE)

colnames(AZTK)<-c("Aztk_d")
colnames(TELE)<-c("Tele_d")

head(AZTK)
head(TELE)

dim(AZTK)
dim(TELE)

m_info<-merge(AZTK,TELE,all = F)
dim(m_info)
head(m_info)
charts.PerformanceSummary(m_info,main = "Comparacion")


#Sharpe Ratio

table.AnnualizedReturns(m_info,scale = 252,Rf=0.005/252)


