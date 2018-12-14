PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO "schema_migrations" VALUES('20170603164133');
INSERT INTO "schema_migrations" VALUES('20170603164214');
INSERT INTO "schema_migrations" VALUES('20170603172551');
INSERT INTO "schema_migrations" VALUES('20170603181557');
INSERT INTO "schema_migrations" VALUES('20170607012224');
INSERT INTO "schema_migrations" VALUES('20170608110308');
INSERT INTO "schema_migrations" VALUES('20170608112155');
INSERT INTO "schema_migrations" VALUES('20170609183307');
INSERT INTO "schema_migrations" VALUES('20170611151737');
INSERT INTO "schema_migrations" VALUES('20170613025105');
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "ar_internal_metadata" VALUES('environment','development','2017-06-03 16:44:27.859100','2017-06-03 16:44:27.859100');
CREATE TABLE "friendly_id_slugs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "slug" varchar NOT NULL, "sluggable_id" integer NOT NULL, "sluggable_type" varchar(50), "scope" varchar, "created_at" datetime);
CREATE TABLE "universities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "slug" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "universities" VALUES(4,'Harvard','	Harvard University is devoted to excellence in teaching, learning, and research, and to developing leaders in many disciplines who make a difference globally. Harvard faculty are engaged with teaching and research to push the boundaries of human knowledge. The University has twelve degree-granting Schools in addition to the Radcliffe Institute for Advanced Study. 

Established in 1636, Harvard is the oldest institution of higher education in the United States. The University, which is based in Cambridge and Boston, Massachusetts, has an enrollment of over 20,000 degree candidates, including undergraduate, graduate, and professional students. Harvard has more than 360,000 alumni around the world.','harvard','2017-06-03 17:12:29.863434','2017-06-15 12:53:30.074934');
INSERT INTO "universities" VALUES(6,'Cambridge','It''s a very beautiful university','cambridge','2017-06-06 23:49:25.232044','2017-06-06 23:49:25.232044');
CREATE TABLE "levels" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "levels" VALUES(1,'Beginner','2017-06-03 18:17:26.269512','2017-06-03 18:17:26.269512');
INSERT INTO "levels" VALUES(2,'Intermediate','2017-06-03 18:18:03.763077','2017-06-03 18:18:03.763077');
INSERT INTO "levels" VALUES(3,'Advanced','2017-06-03 18:18:13.538007','2017-06-03 18:18:13.538007');
INSERT INTO "levels" VALUES(4,'Noob','2018-12-12 17:54:33.144782','2018-12-12 17:54:33.144782');
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar DEFAULT NULL, "admin" boolean DEFAULT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "remember_created_at" datetime DEFAULT NULL, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime DEFAULT NULL, "last_sign_in_at" datetime DEFAULT NULL, "current_sign_in_ip" varchar DEFAULT NULL, "last_sign_in_ip" varchar DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "teacher_role" boolean DEFAULT NULL, "student_role" boolean DEFAULT NULL, "university_id" integer);
INSERT INTO "users" VALUES(2,'Admin','t','admin@mail.com','$2a$11$r1iYCkSUd7Jw.WlcA29PjezUSnsrRSCOt4thk4QnmIEEcLNwMbYsa',NULL,32,'2018-12-14 08:16:15.939900','2018-12-12 17:52:57.453293','196.22.245.62','41.246.26.105','2017-06-08 22:53:35.849562','2018-12-14 08:16:15.941701','f','f',NULL);
INSERT INTO "users" VALUES(3,'Teacher','f','teacher@mail.com','$2a$11$rjUaxPiScrSLzbFRWVDI8uN.ifFulOvwW/PW4E3svAlzeTRuyE1qW',NULL,41,'2018-12-12 17:55:52.116737','2017-06-15 14:31:09.578716','41.246.26.86','127.0.0.1','2017-06-09 01:12:17.342027','2018-12-12 17:55:52.117322','t','f',4);
INSERT INTO "users" VALUES(4,'Student','f','student@mail.com','$2a$11$ZcSjsT63XKnh8e3tEOJ.l.71CvE3sqbfymMlOFaTXHUKIe9SL7mKi',NULL,16,'2017-06-15 15:30:26.618109','2017-06-15 14:21:40.664938','127.0.0.1','127.0.0.1','2017-06-11 18:20:31.632683','2017-06-15 15:30:26.620112','f','t',NULL);
INSERT INTO "users" VALUES(27,'a',NULL,'test@w.com','$2a$11$5OYddPaBLIZDqoFtMe/HX.aJC8mnXstMQfR.E2L.FTOtOa6cIUygy',NULL,1,'2017-06-13 03:30:54.514718','2017-06-13 03:30:54.514718','127.0.0.1','127.0.0.1','2017-06-13 03:30:54.507713','2017-06-13 03:30:54.515719','t','t',NULL);
INSERT INTO "users" VALUES(28,'Nigel',NULL,'nigel@nseye.org','$2a$11$o2LrOSolY/dqaw9TolkJRO0CTUSF.V0/qxY0WOTSlgLqp8fYgNify',NULL,1,'2018-12-13 17:14:18.311766','2018-12-13 17:14:18.311766','41.246.24.120','41.246.24.120','2018-12-13 17:14:18.279819','2018-12-13 17:14:18.312724','f','t',NULL);
CREATE TABLE courses (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title varchar, description text, length integer, subjectstring varchar, level integer, image_url varchar, slug varchar, university_id integer, created_at datetime NOT NULL, updated_at datetime NOT NULL, user_id integer, CONSTRAINT fk_rails_53c77a1710 FOREIGN KEY (university_id) REFERENCES universities (id));
INSERT INTO "courses" VALUES(3,'C Sharp programming','Learn the C# programming language, the most widely used language for .NET from Microsoft experts.',6,'Technology',3,'','c-programming',4,'2017-06-11 13:53:09.952426','2017-06-15 13:07:15.093760',3);
INSERT INTO "courses" VALUES(7,'Microeconomics','In this course, we’ll introduce you to microeconomic theory, together with some empirical results and policy implications. You’ll analyze mathematical models that describe the real-world behavior of consumers and firms, and you’ll see how prices make the world go ‘round.',5,'Economy',2,'','',4,'2017-06-14 17:47:04.292412','2017-06-15 12:57:59.155668',3);
INSERT INTO "courses" VALUES(8,'Software Development Fundamentals','Learn the fundamentals of object-oriented programming in Java, as well as best practices of modern software development.',4,'Computer Science',2,'','software-development-fundamentals',4,'2017-06-15 13:06:02.711450','2017-06-15 13:06:02.711450',3);
CREATE TABLE "course_enrollements" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "course_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_82a08e1dc5"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_893cabf6f0"
FOREIGN KEY ("course_id")
  REFERENCES "courses" ("id")
);
INSERT INTO "course_enrollements" VALUES(30,4,3,'2017-06-15 15:43:13.833970','2017-06-15 15:43:13.833970');
INSERT INTO "course_enrollements" VALUES(32,28,3,'2018-12-13 17:15:28.087338','2018-12-13 17:15:28.087338');
INSERT INTO "course_enrollements" VALUES(33,28,7,'2018-12-13 17:16:24.304388','2018-12-13 17:16:24.304388');
INSERT INTO "course_enrollements" VALUES(34,28,8,'2018-12-13 17:16:55.323537','2018-12-13 17:16:55.323537');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('universities',8);
INSERT INTO "sqlite_sequence" VALUES('levels',4);
INSERT INTO "sqlite_sequence" VALUES('users',28);
INSERT INTO "sqlite_sequence" VALUES('courses',8);
INSERT INTO "sqlite_sequence" VALUES('course_enrollements',34);
CREATE INDEX "index_friendly_id_slugs_on_sluggable_id" ON "friendly_id_slugs" ("sluggable_id");
CREATE INDEX "index_friendly_id_slugs_on_slug_and_sluggable_type" ON "friendly_id_slugs" ("slug", "sluggable_type");
CREATE UNIQUE INDEX "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope" ON "friendly_id_slugs" ("slug", "sluggable_type", "scope");
CREATE INDEX "index_friendly_id_slugs_on_sluggable_type" ON "friendly_id_slugs" ("sluggable_type");
CREATE UNIQUE INDEX "index_universities_on_slug" ON "universities" ("slug");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE INDEX index_courses_on_university_id ON courses ("university_id");
CREATE UNIQUE INDEX index_courses_on_slug ON courses ("slug");
CREATE INDEX index_courses_on_user_id ON courses ("user_id");
CREATE INDEX "index_users_on_university_id" ON "users" ("university_id");
CREATE INDEX "index_course_enrollements_on_user_id" ON "course_enrollements" ("user_id");
CREATE INDEX "index_course_enrollements_on_course_id" ON "course_enrollements" ("course_id");
COMMIT;
