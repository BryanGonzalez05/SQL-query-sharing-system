import javax.swing.plaf.nimbus.State;
import java.io.*;
import java.util.*;
import java.sql.*;

class Parameter{
    String pn;
    String pv;

    Parameter(String pn, String pv){
        this.pn = pn;
        this.pv = pv;
    }

    String getPn(){
        return this.pn;
    }

    String getPv(){
        return this.pv;
    }
}
public class Main {

    public static void main(String[] args) {
        String[] banned = {
                "drop",
                "delete",
                "update",
                "insert",
                "alter",
                "truncate"
        };

        try(Connection conn = DB_connection.getConnection()){
            //test connection
            if(conn != null && conn.isValid(5)){
                System.out.println("Connection success!");
                boolean active = true;
                Scanner s = new Scanner(System.in);

                while (active){
                    System.out.println("\n*** MYSQL QUESTIONS ***");
                    System.out.println("1. Create query question (Problem Specifier)");
                    System.out.println("2. Select question to answer (SQL developer)");
                    System.out.println("3. View runnable solutions (Information seeker)");
                    System.out.println("4. Exit");

                    String input = s.nextLine();

                    switch(input){
                        case "1":
                            System.out.println("Enter a problem (enter EXIT to exit) : ");
                            String question = s.nextLine().trim();

                            if(question.isEmpty()){
                                System.out.println("Error input empty");
                                break;
                            }
                            if(question.equalsIgnoreCase("exit")){
                                break;
                            }

                            String insert = "INSERT INTO problems (description) VALUES (?)";

                            try(PreparedStatement p = conn.prepareStatement(insert)){
                                p.setString(1,question);
                                p.executeUpdate();
                                System.out.println("Problem has be inserted to database");
                            } catch(SQLException e){
                                System.out.println("Something went wrong: " + e.getMessage());
                            }
                            break;
                        case "2":
                            String statement = """
                                    select p.problem_id, p.description
                                    FROM problems as p
                                    LEFT Join sql_contributions as sqc on p.problem_id = sqc.problem_id
                                    WHERE sqc.problem_id is NULL;
                                    """;

                            try(PreparedStatement st = conn.prepareStatement(statement)) {
                                ResultSet rs = st.executeQuery();
                                Map<Integer,String> problems = new HashMap<>();
                                while (rs.next()) {
                                    int id = rs.getInt("problem_id");
                                    String p_Description = rs.getString("description");
                                    System.out.println("id: " + id + " : " + p_Description);
                                    problems.put(id,p_Description);
                                }

                                if(problems.isEmpty()){
                                    System.out.println("There are no problems to solve!");
                                    break;
                                }
                                System.out.println("select a problem id to solve (type exit to exit) ");
                                String select = s.nextLine().trim();

                                if(select.isEmpty()){
                                    System.out.println("ERROR. Empty input");
                                    break;
                                }

                                if(select.equalsIgnoreCase("exit")){
                                    break;
                                }

                                try{
                                    int p = Integer.parseInt(select);
                                    if(problems.containsKey(p)) {
                                        System.out.println("Enter you SQL solution (add END on a last line to end statement)");
                                        StringBuilder sb = new StringBuilder();

                                        while(true){
                                            String solution = s.nextLine();
                                            if(solution.equalsIgnoreCase("end")) break;
                                            sb.append(solution).append("\n");
                                        }

                                        String completeSolution = sb.toString();
                                        for(String i : banned){
                                            if(completeSolution.toLowerCase().contains(i)){
                                                System.out.println("Error! only select statements");
                                                return;
                                            }
                                        }

                                        List<Parameter> values = new ArrayList<>();
                                        if(completeSolution.contains("?")){
                                            long count = completeSolution.chars().filter(c -> c == '?').count();
                                            System.out.println("You have " + count + " parameters. Enter from first to last");
                                            for(int i = 0; i < count; i++){
                                                System.out.println("Enter parameter name: ");
                                                String pn = s.nextLine();
                                                while(pn.trim().isEmpty()){
                                                    System.out.println("Enter parameter name: ");
                                                    pn = s.nextLine();
                                                }
                                                System.out.println("Enter parameter type (ex: int):");
                                                String pv = s.nextLine();
                                                while(pv.trim().isEmpty()){
                                                    System.out.println("Enter parameter type (ex: int):");
                                                    pv = s.nextLine();
                                                }
                                                values.add(new Parameter(pn, pv));
                                            }
                                        }

                                        try(PreparedStatement solutionCreated = conn.prepareStatement("Insert into sql_contributions (problem_id, sql_statement) VALUES (?,?)")){
                                            solutionCreated.setString(1,Integer.toString(p));
                                            solutionCreated.setString(2,completeSolution);
                                            solutionCreated.executeUpdate();

                                            PreparedStatement getIS = conn.prepareStatement("select sql_id from sql_contributions where problem_id = ? order by sql_id limit 1");
                                            getIS.setInt(1,p);
                                            ResultSet rs2 = getIS.executeQuery();
                                            int sqlid = -1;
                                            if(rs2.next()){
                                                sqlid = rs2.getInt("sql_id");
                                            }

                                            int i = 0;
                                            while(i < values.size()){
                                                Parameter getP = values.get(i);
                                                PreparedStatement setQueries = conn.prepareStatement("Insert into runnable_queries (problem_id, sql_id, parameter_name, parameter_type) VALUES (?,?,?,?)");
                                                setQueries.setString(1,Integer.toString(p));
                                                setQueries.setString(2,Integer.toString(sqlid));
                                                setQueries.setString(3,getP.getPn());
                                                setQueries.setString(4, getP.getPv());
                                                setQueries.executeUpdate();
                                                i++;
                                            }

                                            System.out.println("Solution has been submitted!");

                                        } catch (SQLException e){
                                            System.out.println("Error: " + e.getMessage());
                                        }
                                    } else{
                                        System.out.println("problem does not exist");
                                        break;
                                    }
                                } catch(NumberFormatException e) {
                                    System.out.print("invalid number!");
                                    break;
                                }
                            } catch(SQLException e){
                                System.out.println("ERROR something went wrong : " + e.getMessage());
                            }
                            break;
                        case "3":
                            List<Integer> question_id = new ArrayList<>();
                            List<String> question_descrip = new ArrayList<>();

                            String getQuestions = "Select * from problems join sql_contributions as sc on problems.problem_id = sc.problem_id;";

                            try(PreparedStatement statement3 = conn.prepareStatement(getQuestions)){
                                ResultSet rs = statement3.executeQuery();

                                while(rs.next()){
                                    int id = rs.getInt("problem_id");
                                    question_id.add(id);
                                    String pString = rs.getString("description");
                                    question_descrip.add(pString);
                                }

                                if(question_id.isEmpty()){
                                    System.out.println("There are no questions with solutions\n");
                                    break;
                                } else{
                                    System.out.println("Questions with sql contributions:");
                                    for(int i = 0; i < question_id.size(); i++){
                                        System.out.println("ID " + question_id.get(i) + ": " + question_descrip.get(i) + "\n");
                                    }
                                    System.out.println("Enter questions id to see solution (type exit to exit):");
                                    String userInput = s.nextLine().trim();

                                    if(userInput.isEmpty()){
                                        System.out.println("input is empty!");
                                        break;
                                    }

                                    if(userInput.equalsIgnoreCase("exit")){
                                        break;
                                    }

                                    try{
                                        int pID = Integer.parseInt(userInput);

                                        if(question_id.contains(pID)){

                                            PreparedStatement getSolution = conn.prepareStatement("Select * from sql_contributions where problem_id = ?");
                                            getSolution.setInt(1, pID);
                                            ResultSet res4 = getSolution.executeQuery();
                                            String solutionDescription;
                                            int solutionID;
                                            if(res4.next()){
                                                solutionDescription = res4.getString("sql_statement");
                                                solutionID = res4.getInt("sql_id");
                                            } else{
                                                break;
                                            }

                                            try{
                                                PreparedStatement checkQueries = conn.prepareStatement("Select * from runnable_queries where problem_id = ? ");
                                                checkQueries.setInt(1, pID);
                                                ResultSet rs3 = checkQueries.executeQuery();
                                                List<Parameter> solutionP = new ArrayList<>();
                                                while(rs3.next()){
                                                    String parameterName = rs3.getString("parameter_name");
                                                    String parameterType = rs3.getString("parameter_type");
                                                    solutionP.add(new Parameter(parameterName,parameterType));
                                                }

                                                if(!solutionP.isEmpty()) {
                                                    String pi;
                                                    List<String> parameterInputs = new ArrayList<>();
                                                    System.out.println("Input values for the following parameter\n");
                                                    for (int i = 0; i < solutionP.size(); i++) {
                                                        if (solutionP.get(i).pv.equalsIgnoreCase("int") || solutionP.get(i).pv.equalsIgnoreCase("integer")) {
                                                            System.out.println("Input int for " + solutionP.get(i).pn);
                                                            pi = s.nextLine().trim();
                                                            while (pi.isEmpty()) {
                                                                System.out.println("Input int for " + solutionP.get(i).pn);
                                                                pi = s.nextLine().trim();
                                                            }
                                                        } else {
                                                            System.out.println("Input string for " + solutionP.get(i).pn);
                                                            pi = s.nextLine().trim();
                                                            while (pi.isEmpty()) {
                                                                System.out.println("Input int for " + solutionP.get(i).pn);
                                                                pi = s.nextLine().trim();
                                                            }
                                                        }
                                                        parameterInputs.add(pi);
                                                    }

                                                    PreparedStatement getS = conn.prepareStatement(solutionDescription);

                                                    for(int j = 0; j < parameterInputs.size(); j++){
                                                        getS.setObject(j+1, parameterInputs.get(j));
                                                    }

                                                    ResultSet result = getS.executeQuery();

                                                    ResultSetMetaData getCol = result.getMetaData();

                                                    int col = getCol.getColumnCount();
                                                    while(result.next()){
                                                        for(int i = 1; i <= col; i++){
                                                            System.out.print(result.getString(i) + " ");
                                                        }
                                                        System.out.println();
                                                    }
                                                } else{

                                                    PreparedStatement getS = conn.prepareStatement(solutionDescription);
                                                    ResultSet result = getS.executeQuery();

                                                    ResultSetMetaData getCol = result.getMetaData();

                                                    int col = getCol.getColumnCount();
                                                    while(result.next()){
                                                        for(int i = 1; i <= col; i++){
                                                            System.out.print(result.getString(i) + " ");
                                                        }
                                                        System.out.println();
                                                    }
                                                }
                                            } catch (SQLException e){
                                                System.out.println(e.getMessage());
                                                break;
                                            }

                                        } else {
                                            System.out.println("problem does not exist");
                                            break;
                                        }
                                    } catch (NumberFormatException e){
                                        System.out.print("invalid number!");
                                        break;
                                    }
                                }
                            } catch (SQLException e){
                                System.out.println("Error: " + e.getMessage());
                            }
                            break;
                        case "4":
                            active = false;
                            break;
                        default:
                            System.out.println("Invalid selection");
                    }
                }
            } else {
                System.out.print("Connection failed");
            }
        } catch (SQLException e){
            System.out.println("Database error: " + e.getMessage());
        } catch (Exception e){
            System.out.println("General error: " + e.getMessage());
        }

    }
}