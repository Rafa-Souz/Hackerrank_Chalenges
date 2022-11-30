SELECT B.N
    ,CASE WHEN P IS NULL THEN 'Root'
    WHEN EXISTS(SELECT 1
                FROM BST BB
                WHERE B.N = BB.P
                GROUP BY BB.P
                HAVING COUNT(BB.P)>1) THEN 'Inner'
        ELSE 'Leaf' 
    END P
FROM bst B
ORDER BY 1