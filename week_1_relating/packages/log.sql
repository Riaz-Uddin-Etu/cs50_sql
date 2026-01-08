
-- *** The Lost Letter ***
SELECT *
FROM addresses
WHERE id = (SELECT to_address_id
    FROM packages
    JOIN addresses
    ON packages.from_address_id = addresses.id
    WHERE address LIKE '900 Somerville Avenue' AND contents LIKE '%congratulatory%'
    LIMIT 20
);

-- *** The Devious Delivery ***

SELECT address, type
FROM addresses
WHERE id = (
    SELECT to_address_id
    FROM packages
    WHERE from_address_id IS Null
);

-- *** The Forgotten Gift ***
SELECT action, contents, name
FROM scans s
JOIN packages p
ON s.package_id = p.id
JOIN drivers d
ON s.driver_id = d.id
WHERE package_id = (
    -- package id
    SELECT id
    FROM packages
    WHERE from_address_id = (
        -- address id of senders
        SELECT id
        FROM addresses
        WHERE address = '109 Tileston Street'
    )
);

