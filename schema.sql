-- Courts Table
CREATE TABLE courts (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT
);

-- Courtrooms Table
CREATE TABLE courtrooms (
  id SERIAL PRIMARY KEY,
  court_id INTEGER REFERENCES courts(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  zoom_link TEXT
);

-- Scheduling Preferences Table
CREATE TABLE scheduling_preferences (
  id SERIAL PRIMARY KEY,
  preference TEXT CHECK (preference IN ('ZOOM', 'Phone', 'In-Person'))
);

-- Interpreters Table
CREATE TABLE interpreters (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT,
  phone TEXT,
  timezone TEXT DEFAULT 'PST',

  language_1 TEXT,
  language_1_certification TEXT CHECK (language_1_certification IN ('Reg', 'Cert', 'Neither')),

  language_2 TEXT,
  language_2_certification TEXT CHECK (language_2_certification IN ('Reg', 'Cert', 'Neither')),

  language_3 TEXT,
  language_3_certification TEXT CHECK (language_3_certification IN ('Reg', 'Cert', 'Neither'))
);

-- Interpreter Preferences (link table for many-to-many)
CREATE TABLE interpreter_preferences (
  interpreter_id INTEGER REFERENCES interpreters(id) ON DELETE CASCADE,
  preference_id INTEGER REFERENCES scheduling_preferences(id) ON DELETE CASCADE,
  PRIMARY KEY (interpreter_id, preference_id)
);

-- Job Requests Table
CREATE TABLE job_requests (
  id SERIAL PRIMARY KEY,
  courtroom_id INTEGER REFERENCES courtrooms(id),
  scheduled_datetime TIMESTAMP NOT NULL,
  duration_hours INTEGER DEFAULT 2 CHECK (duration_hours IN (2, 3)),
  language_needed TEXT NOT NULL,
  case_number TEXT,
  case_details TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);