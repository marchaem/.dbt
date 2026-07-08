SELECT
    -- Alias Column1 as id for clearer identification
    [Column1] AS id,
    -- Select the remaining columns for additional product details
    [Column2],
    [Column3],
    [Column4],
    [Column5],
    [Column6],
    [Column7],
    [Column8],
    [Column9]
from {{ source('sales_database', 'product') }}