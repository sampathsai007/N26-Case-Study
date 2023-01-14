public class CaseDAO {

    public static case getRecordbyId(List<String> queryFields,Id caseId) {
        String query = 'SELECT ';
        for (Integer i = 0; i < queryFields.size(); i++) {
            query += queryFields[i] + ' ,';
        }
        if (queryFields.size() != 0) {
            query = query.substring(0, query.length() - 1);
        }
        query += ' FROM Case Where Id =:caseId ';
        System.debug('CaseDAO  getRecordbyId'+query);
        return Database.query(query);
    }
}