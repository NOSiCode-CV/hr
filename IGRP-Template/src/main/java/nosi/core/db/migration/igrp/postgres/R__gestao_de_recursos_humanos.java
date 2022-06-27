package nosi.core.db.migration.igrp.postgres;

import nosi.core.db.migration.igrp.IgrpMigrationTemplate;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.Transaction;

/**
 * Nositeste
 * jun. 27, 2022
 */
public class R__gestao_de_recursos_humanos extends IgrpMigrationTemplate{

	@Override
	public void app() {
	  this.app = new Application("gestao_de_recursos_humanos", "Gestão de Recursos Humanos", "default.svg", "Aplicação de treinamento em formação", 1, null,"");
	}

	@Override
	public void pages() {
	  this.actions.add(new Action("Lista_de_empregados", "index", "nosi.webapps.gestao_de_recursos_humanos.pages", "gestao_de_recursos_humanos/lista_de_empregados/Lista_de_empregados.xsl", "Lista de Empregados", "Lista de Empregados", "2.3", 1, this.app, (short)0, null, null, (short)0));
	  this.actions.add(new Action("Funcionario", "index", "nosi.webapps.gestao_de_recursos_humanos.pages", "gestao_de_recursos_humanos/funcionario/Funcionario.xsl", "Funcionário", "Funcionário", "2.3", 1, this.app, (short)0, null, null, (short)0));
	  this.actions.add(new Action("Dashboard", "index", "nosi.webapps.gestao_de_recursos_humanos.pages", "gestao_de_recursos_humanos/dashboard/Dashboard.xsl", "Dashboard", "Dashboard", "2.3", 1, this.app, (short)0, null, null, (short)0));
	}

	@Override
	public void transactions() {
	  this.transactions.add(new Transaction("gestao_de_recursos_humanos_Lista_de_empregados_eliminar", "Eliminar", 1, this.app));
	}

	@Override
	public void domains() {
		// Not implemented yet... Put your code here!
	}

	@Override
	public void dbConnections() {
	  this.configs.add(new Config_env(null,null,null, "utf-8", "G6pC5Z/zvrwZsWyWjfO0RA==", "N/EwTHhbGGqWg6o5mrTlhA==", "N/EwTHhbGGqWg6o5mrTlhA==", "gestao_de_recursos_humanos_postgresql_1", "rvDSR1rjREYbBKk7KybFLkNuiy8sacBkrIT9jGIQvI2rA6MJancZ6oQLrqx16iUy", "fDYSEiVw09DSlMzSTJUW6XvVluz2/lrAfVM3rchj8pc=", this.app, (short)1, "cc4424dd-22f2-4a3d-a3d6-d317984082ab"));	}

	@Override
	public void reports() {
		// Not implemented yet... Put your code here!
	}

	@Override
	public void bpmns() {
		// Not implemented yet... Put your code here!
	}

	@Override
	public void documentTypes() {
		// Not implemented yet... Put your code here!
	}


	@Override
	public Integer getChecksum() {
		return 50096846;
	}

}