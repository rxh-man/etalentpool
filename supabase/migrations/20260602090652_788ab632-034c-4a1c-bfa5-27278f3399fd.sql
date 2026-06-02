CREATE TABLE public.app_users (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  username TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  role TEXT NOT NULL DEFAULT 'viewer',
  active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.app_users TO anon, authenticated;
GRANT ALL ON public.app_users TO service_role;

ALTER TABLE public.app_users ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public read app_users" ON public.app_users FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "public insert app_users" ON public.app_users FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "public update app_users" ON public.app_users FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
CREATE POLICY "public delete app_users" ON public.app_users FOR DELETE TO anon, authenticated USING (true);

ALTER PUBLICATION supabase_realtime ADD TABLE public.app_users;

INSERT INTO public.app_users (name, username, password, role, active) VALUES
  ('Asaad Tawfik', 'asatawfik@eand.com', '123999', 'director', true),
  ('Anoop', 'anothomas@eand.com', '123999', 'director', true),
  ('Amr Fahmy', 'aalifahmy@eand.com', '123999', 'director', true)
ON CONFLICT (username) DO NOTHING;