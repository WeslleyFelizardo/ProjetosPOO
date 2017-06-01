package br.com.fatecpg.modelo;


public class Question {
    private String question;
    private String answer;
    private String[] alternatives;
    private String type;
    
    public Question(String question, String answer, String[] alternatives, String type) {
        this.setQuestion(question);
        this.setAnswer(answer);
        this.setAlternatives(alternatives);
        this.setType(type);
    }
    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    
    
    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String[] getAlternatives() {
        return alternatives;
    }

    public void setAlternatives(String[] alternatives) {
        this.alternatives = alternatives;
    }
    
}