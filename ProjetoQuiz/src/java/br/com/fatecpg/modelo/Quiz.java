package br.com.fatecpg.modelo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class Quiz {
    private static int testsCount = 0;
    private static double testsGradeSum = 0.0;
    private static double lastGrade = 0.0;
    private static ArrayList<Question> questionRandom;
    public static ArrayList<String> answer;
    
    public static Map<Integer, Question> questions;
    
     public static ArrayList<Player> ranking = new ArrayList<Player>();
    /**
     * @param args the command line arguments
     */
   
   private static Map<Integer, Question> getQuestions(){
        questions = new HashMap<Integer, Question>();
        
        questions.put(1, new Question("1+1", "2", new String[]{"1","2","3","4"}, "Matematica"));
        questions.put(2, new Question("4*2", "8", new String[]{"8","2","3","4"}, "Matematica"));
        questions.put(3, new Question("8/2", "4", new String[]{"8","2","3","4"}, "Matematica"));
        questions.put(4, new Question("2-2", "0", new String[]{"0","2","3","4"}, "Matematica"));
        questions.put(5, new Question("2/2", "1", new String[]{"8","2","1","4"}, "Matematica"));
        questions.put(6, new Question("0*0", "0", new String[]{"1","0","3","4"}, "Matematica"));
        questions.put(7, new Question("2+2", "4", new String[]{"8","2","3","4"}, "Matematica"));
        questions.put(8, new Question("-1+0", "-1", new String[]{"-1","2","3","4"}, "Matematica"));
        questions.put(9, new Question("2+5", "7", new String[]{"7","2","3","4"}, "Matematica"));
        questions.put(10, new Question("0-2", "-2", new String[]{"-2","2","3","4"}, "Matematica"));
        questions.put(11, new Question("One", "Como se diz 1 em inglês?", new String[]{"5","14","32","1"}, "Ingles"));
        questions.put(12, new Question("Six", "Como se diz 6 em inglês?", new String[]{"15","6","9","12"}, "Ingles"));
        questions.put(13, new Question("Como se diz 33 em inglês?", "Thirty-three", new String[]{"Twelve three","Twenty three","Thirty-three","Forty three"}, "Ingles"));
        questions.put(14, new Question("Qual o plural de \"batata\"?", "Potatoes", new String[]{"Tomatos","Potatos","Apples","Potatoes"}, "Ingles"));
        questions.put(15, new Question("Como se diz ''borracha'' em inglês?", "Eraser", new String[]{"Eraser","Ruler","Borracha","Watermelon"}, "Ingles"));
        questions.put(16, new Question("Qual a tradução de fish, horse, cow, cat, dog, bird e bear, respectivamente?", "Peixe, cavalo, vaca, gato, cachorro, pássaro e urso", new String[]{"Peixe, vaca, cavalo, gato, cachorro, pássaro e urso","Peixe, cavalo, pássaro, vaca, gato, cachorro e urso","Peixe, cavalo, vaca, cachorro, gato, pássaro e urso","Peixe, cavalo, vaca, gato, cachorro, pássaro e urso"}, "Ingles"));
        questions.put(17, new Question("Como se diz 51 em inglês?", "fifty one", new String[]{"fifty one","fifteen","fifty three","fifty four"}, "Ingles"));
        questions.put(18, new Question("Como se diz 100 em inglês?", "one-hundred", new String[]{"ten-hundred","one-hundred","thousand-hundred","one-thousand"}, "Ingles"));
        questions.put(19, new Question("Como se diz 2017 em inglês?", "two thousand and seventeen", new String[]{"two thousand and seventy","two thousand and seventy one","two thousand and seventeen","teen thousand and two"}, "Ingles"));
        questions.put(20, new Question("Como se diz 1000 em inglês?", "one thousand", new String[]{"ten hundred","one hundred","hundred thousand","one thousand"}, "Ingles"));
        questions.put(21, new Question("Quantos titulos mundiais tem o Corinthians?", "2", new String[]{"1","4","2","3"}, "Futebol"));
        questions.put(22, new Question("Quem fez os gols da final da Copa do Mundo de 2002?", "Ronaldo", new String[]{"Rivaldo","Denilson","Ronaldinho Gaúcho","Ronaldo"}, "Futebol"));
        questions.put(23, new Question("Quantas Copa do Mundo o Brasil ganhou?", "5", new String[]{"5","2","3","4"}, "Futebol"));
        questions.put(24, new Question("Quem é o maior artilheiro de todas as Copas do Mundo?", "Klose", new String[]{"Ronaldo","Pelé","Maradona","Klose"}, "Futebol"));
        questions.put(25, new Question("Qual era a dubla de ataque do Brasil na Copa do Mundo de 1994", "Romário e Bebeto", new String[]{"Ronaldo e Romário","Romário e Bebeto","Ronaldo e Bebeto","Romário e Paulo Nunes"}, "Futebol"));
        questions.put(26, new Question("Qual é o clube brasileiro que tem o maior número de títulos mundiais?", "São Paulo", new String[]{"São Paulo","Santos","Corinthians","Palmeiras"}, "Futebol"));
        questions.put(27, new Question("Quem perdeu o último penâlti da copa do mundo de 1994?", "Roberto Baggio", new String[]{"Bebeto","Massaro","Roberto Baggio","Ronaldo"}, "Futebol"));
        questions.put(28, new Question("Ronaldinho Gaúcho jogou em que clube da espanha?", "Barcelona", new String[]{"Real Madri","Atlético de Madrid","Barcelona","Lã Coruña"}, "Futebol"));
        questions.put(29, new Question("Quem é o brasileiro considerado mais vezes o melhor jogador do mundo", "Ronaldo", new String[]{"Kaká","Romário","Ronaldinho Gaúcho","Ronaldo"}, "Futebol"));
        questions.put(30, new Question("Qual foi o placar da final do mundial entre Barcelona vs Santos?", "Santos 0 x Barcelona 4", new String[]{"Santos 0 x Barcelona 4","Santos 4 x Barcelona 0","Santos 0 x Barcelona 10","Santos 0 x Barcelona 7"}, "Futebol"));
        return questions;
   }
    
    public static ArrayList<Question> getQuestionsRandom (ArrayList<String> types){
        questionRandom = new ArrayList<Question>();
        
        Map<Integer, Question> allQuestions;
        
        answer = new ArrayList<String>();
        allQuestions = getQuestions();
        
        Random random = new Random();
        
        while(questionRandom.size() < 10){
            int numberRandom = random.nextInt(30) + 1;
            
            if(types.contains(allQuestions.get(numberRandom).getType()) && !ThereIsQuestionInMap(questionRandom, allQuestions.get(numberRandom))){
                questionRandom.add(allQuestions.get(numberRandom));
            }
        }
        return questionRandom;
    }
    
    public static boolean ThereIsQuestionInMap(ArrayList<Question> listQuestions, Question question){
        for (Question item : listQuestions) {
            if(item.getQuestion() == question.getQuestion()){
                return true;
            }
        }
        return false;
    }

    
    public static double validateQuiz(ArrayList<String> userAnswers, ArrayList<Question> questions){
        int count = 0;
        for(int i = 0; i < questions.size(); i++){
            if(questions.get(i).getAnswer().equals(userAnswers.get(i))){
                count++;
            }
        }
        double grade = (double)count / (double)questions.size();
        Quiz.lastGrade = grade;
        Quiz.testsGradeSum += grade;
        Quiz.testsCount++;
        return grade;
    }
    
    public static double getLastGrade(){
        return Quiz.lastGrade;
    }
    
    public static double getGradeAverage(){
        return Quiz.testsGradeSum / (double)Quiz.testsCount;
    }
}