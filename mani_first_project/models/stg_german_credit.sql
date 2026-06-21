{{ config(materialized = 'view') }}

with source as (
        select * from `mani-dbt-learning.dbt_dev.german_credit_raw`
),

cleaned as (
    select 
    case checking_account_status
         when 'A11' then 'less_than_0_DM'
         when 'A12' then '0_to_200_DM'
         when 'A13' then '200_plus_or_salary_assigned'
         when 'A14' then 'no_checking_account'
    end as checking_account_status,
    case credit_history
         when 'A30' then 'no_credits_all_paid'
         when 'A31' then 'all_paid_this_bank'
         when 'A32' then 'existing_paid_till_now'
         when 'A33' then 'past_delay'
         when 'A34' then 'critical_or_other_credits'
    end as credit_history,
    case savings_account
         when 'A61' then 'less_than_100_DM'
         when 'A62' then '100_to_500_DM'
         when 'A63' then '500_to_1000_DM'
         when 'A64' then '1000_plus_DM'
         when 'A65' then 'unknown_or_none'
    end as savings_account,
    case employment_since
         when 'A71' then 'unemployed'
         when 'A72' then 'less_than_1_year'
         when 'A73' then '1_to_4_years'
         when 'A74' then '4_to_7_years'
         when 'A75' then '7_plus_years'
    end as employment_since,
    
    cast(duration_months as int64) as duration_months,
    cast(credit_amount as int64) as credit_amount,
    cast(installment_rate_pct as int64) as installment_rate_pct,
    cast(present_residence_since as int64) as present_residence_since,
    cast(age_years as int64) as age_years,
    cast(existing_credits_count as int64) as existing_credits_count,
    cast(num_dependents as int64) as num_dependents,

    purpose,
    personal_status_sex,
    other_debtors_guarantors,
    property,
    other_installment_plans,
    housing,
    job,
    telephone,
    foreign_worker,

    case cast(credit_risk as int64) 
        when 1 then 'good'
        when 2 then 'bad'
    end as credit_risk_label

    from source
 )

 select * from cleaned   