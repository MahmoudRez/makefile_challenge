

vpath %.c ./Src
vpath %.h ./Inc
CC = gcc
LINK_TARGET = app.exe
INCLUDE_PATH = ./Inc


DEP_path = .\Dependencies

SRC_PATH = ./Src

GEN_SRC = $(subst $(SRC_PATH)/,,$(wildcard $(SRC_PATH)/*.c))
#get the files .o for every file .c and merge the quiz file with them 
GEN_OBJ = $(patsubst %.c,%.o, $(GEN_SRC)) Rizk_MinaRaouf_Wael_Khaled.o

OBJ = main.o LCD.o DIO.o 	


CLEAN_TARGET = $(LINK_TARGET) $(OBJ) 

#Dependencies variables
#GEN_DEP= $(GEN_SRC: .c=.d)
#DEP_FILES2 = $(addprefix $(DEP_path)\,$(GEN_DEP))


#cleaninig 
clean:
	del $(CLEAN_TARGET)
#linking 
$(LINK_TARGET): $(GEN_OBJ)  
# name of the specified object file should be explicitly added here
	$(CC) $(GEN_OBJ) -o $@
# and here also

%.o: %.c
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@
	$(CC) -MM -I$(INCLUDE_PATH) $< > $(DEP_path)\$*.d
# execution  
all:$(LINK_TARGET)