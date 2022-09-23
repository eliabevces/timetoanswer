module SiteHelper
    def msg_jumbotron
        case params[:action]
        when 'index'
            'Ultimas perguntas cadastradas'
        when 'questions'
            "Resultados para \" #{sanitize params[:term]} \": "
        when 'subject'
            "Mostrando questões para o assunto \"#{sanitize params[:subject]}\" "
        end
    end
end
