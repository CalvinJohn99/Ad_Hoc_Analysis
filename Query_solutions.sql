# 1------------------------------------------------------------------------------
# a

select
	r.Gender,
    sum(s.Standardised_consume_frequency) as total_consumption_count_per_month
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
group by Gender order by total_consumption_count_per_month desc;

select
	r.Gender,
    round(avg(s.Standardised_consume_frequency), 2) as avg_consumption_count_per_month
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
group by Gender order by avg_consumption_count_per_month desc;

select
	r.Gender,
    count(*) as respondent_count
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
group by Gender order by respondent_count desc;

# b
select
	r.Age_group,
    sum(s.Standardised_consume_frequency) as total_consumption_count_per_month
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
group by Age_group order by total_consumption_count_per_month desc;

select
	r.Age_group,
    round(avg(s.Standardised_consume_frequency), 2) as avg_consumption_count_per_month
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
group by Age_group order by avg_consumption_count_per_month desc;

select
	r.Age_group,
    count(*) as respondent_count
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
group by Age_group order by respondent_count desc;

# c
select
	s.Marketing_channels,
    count(*) as respondent_count
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
where Age_group in ('19-30', '15-18') 
group by Marketing_channels order by respondent_count desc;

# 2-----------------------------------------------------------
# a
select 
	Ingredients_expected,
    count(*) as respondent_count
from fact_survey_responses
group by Ingredients_expected order by respondent_count desc;

select 
	Improvements_desired,
    count(*) as respondent_count
from fact_survey_responses
group by Improvements_desired order by respondent_count desc;

select 
	Interest_in_natural_or_organic,
    count(*) as respondent_count
from fact_survey_responses
group by Interest_in_natural_or_organic order by respondent_count desc;

# b
select 
	Packaging_preference,
    count(*) as respondent_count
from fact_survey_responses
group by Packaging_preference order by respondent_count desc;

select 
	Limited_edition_packaging,
    count(*) as respondent_count
from fact_survey_responses
group by Limited_edition_packaging order by respondent_count desc;


# 3-----------------------------------------------------------
# a
select 
	current_brands,
    count(*) as respondent_count
from fact_survey_responses
group by current_brands
order by respondent_count desc;

# b
select 
	reasons_for_choosing_brands,
    count(*) as respondent_count
from fact_survey_responses
where current_brands not in ('CodeX', 'Sky9', 'Blue Bull', 'Others')
group by reasons_for_choosing_brands order by respondent_count desc;

# 4-----------------------------------------------------------
with cte1 as (
select * from fact_survey_responses
where current_brands="CodeX")
select marketing_channels, count(*) as respondent_count from cte1
group by marketing_channels
order by respondent_count desc;

select marketing_channels, count(*) as respondent_count from fact_survey_responses
group by marketing_channels order by respondent_count desc;

SELECT Marketing_channels, COUNT(*) AS channel_counts
FROM fact_survey_responses
WHERE Heard_before = 'Yes' 
GROUP BY Marketing_channels order by channel_counts desc;

# 5----------------------------------------------------------------------
# a
select round(avg(taste_experience), 2) as avg_rating 
from fact_survey_responses
;

# What do you think of the brand name/logo/design?
select 
	Brand_perception, 
    count(*) as respondent_count
from fact_survey_responses
group by Brand_perception order by respondent_count desc;

select
	Reasons_preventing_trying,
    count(*) as respondent_count
from fact_survey_responses s 
group by Reasons_preventing_trying
order by respondent_count desc;

# b
select
	city,
	count(*) as respondent_count
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
join dim_cities c
using (City_ID)
where Current_brands='CodeX' 
group by city order by respondent_count;

select
	city,
	count(*) as respondent_count
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
join dim_cities c
using (City_ID) 
group by city order by respondent_count;

select
	city,
	count(*) as respondent_count
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
join dim_cities c
using (City_ID)
where Brand_perception='Negative' 
group by city order by respondent_count;


select
	city,
	Brand_perception,
    count(*) as respondent_count
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
join dim_cities c
using (City_ID)
group by city, Brand_perception order by city, Brand_perception;

select
	city,
	Heard_before,
    count(*) as respondent_count
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
join dim_cities c
using (City_ID)
group by city, Heard_before order by city, Heard_before;

select
	city,
	Tried_before,
    count(*) as respondent_count
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
join dim_cities c
using (City_ID)
group by city, Tried_before order by city, Tried_before;

select
	city,
	Health_concerns,
    count(*) as respondent_count
from fact_survey_responses s 
join dim_respondents r
using (Respondent_ID)
join dim_cities c
using (City_ID)
group by city, Health_concerns order by city, Health_concerns;

select
	Health_concerns,
    count(*) as respondent_count
from fact_survey_responses 
group by Health_concerns order by respondent_count desc;


# 6-------------------------------------------------------------------------------
# a
select 
	purchase_location,
    count(*) as respondent_count
from fact_survey_responses
group by purchase_location
order by respondent_count desc;

# b
select 
	Typical_consumption_situations, 
    count(*) as respondent_count
from fact_survey_responses
group by Typical_consumption_situations order by respondent_count desc;

select 
	consume_time, 
    count(*) as respondent_count
from fact_survey_responses
group by consume_time order by respondent_count desc;

select 
	consume_reason, 
    count(*) as respondent_count
from fact_survey_responses
group by consume_reason order by respondent_count desc;

# c
select
	Price_range,
    count(*) as respondent_count
from fact_survey_responses s 
group by Price_range
order by respondent_count desc;

select 
	Limited_edition_packaging,
    count(*) as respondent_count
from fact_survey_responses
group by Limited_edition_packaging order by respondent_count desc;

select 
	Improvements_desired,
    count(*) as respondent_count
from fact_survey_responses
group by Improvements_desired order by respondent_count desc;

select 
	Interest_in_natural_or_organic,
    count(*) as respondent_count
from fact_survey_responses
group by Interest_in_natural_or_organic order by respondent_count desc;

# 7-----------------------------------------------------------------------
# Brand reputation is the primary reason for customers choosing one of the current market leaders as their 
# energy drink brand, however, they have had decades worth exposure to build this reputation wheras its been only months
# since codex entered the market. Thus, trying to upfront compete with market leaders in this domain would be difficult.
# But, lets pay attention to the second main reason customers choose the market leaders, which is the taste/flavor of the drink.
# Now from the data we see that there is a general opinion among consumers to reduce sugar content in the energy drinks while having access to a wider choice among a variety of flavors.
# So although taste/flavor is a big factor towards brand preference among the market leaders, there is still a value gap in the taste and flavors of energy drinks currently
# in the market. Hence, our primary focus should be on taking advantage of this market gap. Also, if we focus our efforts
# on adapting to customer demands in this way and adopt a customer-centric approach, we would also be building our own brand reputation
# over time as one of the few brands that actually caters towards customer needs. 

# Now, the data shows that the primary reason preventing
# consumers from trying our brand is due to our product not being available locally. 
# It also shows that most consumers typically purchase their energy drinks from supermarkets.
# Noting availability as a contributing factor towards preference towards the market leaders,
# we should also focus on making our product available for physical purchase through supermarkets, gyms/fitness centers, and local stores.
# This is likely to result in more consumers trying our brand, gaining market share, and could result in them switching to our brand.


select
	Reasons_preventing_trying,
    count(*) as respondent_count
from fact_survey_responses s 
group by Reasons_preventing_trying
order by respondent_count desc;

select 
	purchase_location,
    count(*) as respondent_count
from fact_survey_responses
group by purchase_location
order by respondent_count desc;

select 
	reasons_for_choosing_brands,
    count(*) as respondent_count
from fact_survey_responses
where current_brands not in ('CodeX', 'Sky9', 'Blue Bull', 'Others')
group by reasons_for_choosing_brands order by respondent_count desc;


select 
	Improvements_desired,
    count(*) as respondent_count
from fact_survey_responses
group by Improvements_desired order by respondent_count desc;

select round(avg(taste_experience), 2) as avg_rating 
from fact_survey_responses
;

# What do you think of the brand name/logo/design?
select 
	Brand_perception, 
    count(*) as respondent_count
from fact_survey_responses
group by Brand_perception order by respondent_count desc;

select
	count(*)
from 
(select
	*
from fact_survey_responses s
join dim_respondents r
using (Respondent_ID)
where Gender='male' ) as t
where Taste_experience<3
;