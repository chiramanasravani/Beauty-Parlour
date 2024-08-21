# Generated by Django 4.0.3 on 2022-04-03 07:25

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ContactModel',
            fields=[
                ('contact_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=225)),
                ('email', models.EmailField(max_length=50)),
                ('subject', models.CharField(max_length=250)),
                ('message', models.TextField(max_length=2000)),
                ('reg_date', models.DateField(auto_now_add=True)),
            ],
            options={
                'db_table': 'contact_details',
            },
        ),
    ]
