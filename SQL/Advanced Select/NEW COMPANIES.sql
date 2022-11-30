SELECT C.COMPANY_CODE
    ,C.FOUNDER
    ,COUNT(DISTINCT LM.LEAD_MANAGER_CODE)
    ,COUNT(DISTINCT SM.SENIOR_MANAGER_CODE)
    ,COUNT(DISTINCT M.MANAGER_CODE)
    ,COUNT(DISTINCT E.EMPLOYEE_CODE)
FROM COMPANY C
CROSS APPLY (SELECT COMPANY_CODE
                , LEAD_MANAGER_CODE
             FROM LEAD_MANAGER LM
             WHERE C.COMPANY_CODE = LM.COMPANY_CODE) LM
CROSS APPLY (SELECT SENIOR_MANAGER_CODE
            FROM Senior_Manager SM
            WHERE SM.COMPANY_CODE = C.COMPANY_CODE
                AND LM.COMPANY_CODE = SM.COMPANY_CODE) SM
CROSS APPLY (SELECT MANAGER_CODE
                , SENIOR_MANAGER_CODE
             FROM MANAGER M
             WHERE M.SENIOR_MANAGER_CODE = SM.SENIOR_MANAGER_CODE
                AND C.COMPANY_CODE = M.COMPANY_CODE)M
CROSS APPLY (SELECT MANAGER_CODE
                , EMPLOYEE_CODE
             FROM EMPLOYEE E
             WHERE E.MANAGER_CODE = M.MANAGER_CODE
                AND C.COMPANY_CODE = E.COMPANY_CODE)E
GROUP BY C.COMPANY_CODE
    ,C.FOUNDER
ORDER BY 1