
select feedback_id as id, order_id, feedback_score, feedback_form_sent_date as sent_date, feedback_answer_date as answer_date
from {{ source('sales_database', 'feedback') }}

