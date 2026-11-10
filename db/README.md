# Banco do Sentinela

O aplicativo usa Netlify Database (Postgres) no servidor, com Drizzle. A conexão é fornecida pela plataforma; não há credenciais no código. O esquema fica em `schema.ts` e as migrações em `netlify/database/migrations`. Para mudanças futuras, atualize o esquema e gere uma nova migração com `npx drizzle-kit generate --name nome_descritivo`. A plataforma aplica as migrações durante a publicação.

Na primeira consulta após a publicação, o aplicativo importa o SQLite disponível em uma transação. Usa `data/sentinela.db` quando presente; caso contrário, usa o backup `data/backups/before-role-split/sentinela.db`. Neste repositório, somente o backup estava disponível. Dados posteriores a esse backup, armazenados em outro ambiente, não estão incluídos nesta transferência.

A importação preserva identificadores, contas, sessões, preferências, registros e evidências. Contas institucionais antigas sem classificação recebem o perfil de auditor, conforme a regra anterior. O arquivo original é aberto somente para leitura. Um marcador no Postgres e um bloqueio transacional impedem importações repetidas ou concorrentes. Falhas desfazem a transferência inteira e permitem nova tentativa; conflitos não são ignorados.

Depois da importação, todas as leituras e gravações do aplicativo usam Postgres. O SQLite é apenas a fonte da transferência inicial, não o armazenamento da aplicação.
